/*
 * Airline reservation RPC server.
 * Written using libasync's event-driven RPC support.
 *
 * g++ -g -I/usr/local/include/sfs -I/usr/local/include rs.C rx.C -L/usr/local/lib -L/usr/local/lib/sfs -lasync -larpc -ldmalloc -o rs
 */

#include "amisc.h"
#include "async.h"
#include "arpc.h"
#include "rx.h"

/*
 * This is the function implementation; dispatch() calls it to compute
 * the result for each incoming RPC.
 */
void
do_reserve(reserve_args *arg, reserve_result *res) {
  warn << "do_reserve(" << arg->flight_number << ", "
       << arg->passenger_name << ")\n";
  if(/* ... */ 1){
    // There is an available seat.
    res->ok = 1;
    res->seat = "41C";
  } else {
    // All seats are taken.
    res->ok = 0;
    res->seat = "";
  }
}

/*
 * asrv calls dispatch() for each RPC made to the reservation server;
 * dispatch() calls the relevant procedure implementation.
 */
void
dispatch(svccb *sbp)
{
  reserve_result res;

  switch(sbp->proc()){
  case RESERVATION_RESERVE:
    do_reserve(sbp->template getarg<reserve_args> (), &res);
    sbp->reply(&res);
    break;
  default:
    sbp->reject(PROC_UNAVAIL);
    break;
  }
}

main()
{
  int fd;

  /* Don't register a binding; use well-known port 9099. */
  fd = inetsocket(SOCK_DGRAM, 9099, INADDR_ANY);
  if(fd < 0)
    fatal("inetsocket");

  /* axprt provides uniform packet interface to TCP/UDP */
  ref<axprt> x = axprt_dgram::alloc(fd);

  /* asrv unmarshals RPC packets for a given RPC program interface */
  ref<asrv> s = asrv::alloc(x, reservation_prog_1, wrap(dispatch));

  amain();
}
