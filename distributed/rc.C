/*
 * Airline reservation RPC client.
 *
 * g++ -g -I/usr/local/include/sfs -I/usr/local/include rc.C rx.C -L/usr/local/lib -L/usr/local/lib/sfs -lasync -larpc -ldmalloc -o rc
 */

#include "amisc.h"
#include "async.h"
#include "arpc.h"
#include "rx.h"

/*
 * Callback stub, called when reply arrives from server.
 */
void
reserve_done(reserve_result *res,
             callback<void, clnt_stat, int, str>::ref cb,
             clnt_stat err)
{
  cb(err, res->ok, res->seat);
  delete res;
}

/*
 * Call stub, to send RPC to server.
 */
void
reserve_call(ref<aclnt> c, int flight_number, str passenger_name,
             callback<void, clnt_stat, int, str>::ref cb)
{
  reserve_args arg;
  reserve_result *res = new reserve_result;

  arg.flight_number = flight_number;
  arg.passenger_name = passenger_name;

  c->call(RESERVATION_RESERVE, &arg, res, wrap(reserve_done, res, cb));
}

ref<aclnt>
setup()
{
  int fd;
  struct sockaddr_in sin;

  fd = inetsocket(SOCK_DGRAM);
  if(fd < 0)
    fatal("inetsocket");

  /*
   * Connect to server on port 9099 on local host.
   * This is a poor man's binding scheme.
   */
  bzero(&sin, sizeof(sin));
  sin.sin_family = AF_INET;
  sin.sin_port = htons(9099);
  connect(fd, (struct sockaddr *) &sin, sizeof(sin));

  /* axprt provides uniform packet interface to TCP/UDP */
  ref<axprt> x = axprt_dgram::alloc(fd);

  /* aclnt marshals RPC packets for a given RPC program interface */
  ref<aclnt> c = aclnt::alloc(x, reservation_prog_1);

  return(c);
}

/*
 * This is the client code.
 * run1() makes an RPC, using the call stub.
 * run2() is the callback to handle the reply.
 */
void
run2(clnt_stat err, int ok, str seat)
{
  if(err)
    warn << "run2: RPC failed\n";
  else if(ok != 1)
    warn << "run2: reservation failed\n";
  else
    warn << "reserved seat " << seat << "\n";
}

void
run1(ref<aclnt> c)
{
  reserve_call(c, 1490, "Robert Morris", wrap(run2));
}

main()
{
  ref<aclnt> c = setup();

  run1(c);

  amain();
}
