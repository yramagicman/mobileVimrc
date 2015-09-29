/*
 * Airline reservation RPC interface definition.
 * This definition is in standard Sun RPC/XDR format.
 *
 * Run the following programs to generate C++ stubs and
 * data type definitions from this definition:
 *   rpcc -c rx.x ; rpcc -h rx.x
 *
 * This will create files rx.h and rx.C, which contain
 * marshaling/unmarshaling routines for use in rs.C and rc.C.
 */

struct reserve_args {
  int flight_number;
  string passenger_name<>;
};

struct reserve_result {
  int ok;
  string seat<>;
};

program RESERVATION_PROG {
  version RESERVATION_VERS {
    reserve_result RESERVATION_RESERVE (reserve_args) = 1;
  } = 1;
} = 400001;
