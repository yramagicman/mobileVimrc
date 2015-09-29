//
// Example 1
// Typical UNIX kernel implementation of
// a blocking system call.
//

sys_read(fd, user_buffer, n){
  // read the file's i-node from the disk
  struct inode *i = alloc_inode();
  start_disk(..., i);
  wait_for_disk(i);

  // the i-node tells us where the data is; read it.
  struct buf *b = alloc_buf(i->...);
  start_disk(..., b);
  wait_for_disk(b);
  copy_to_user(b, user_buffer);
}


//
// Example 2
// UNIX kernel implementation of read() system
// call for communication descriptors, such as
// sockets, pipes, and terminals.
//

sys_read(fd, user_buffer, n) {
  while(1){
    if(data buffered for fd){
      copy_to_user(..., user_buffer);
      return;
    }
    wait for input to arrive on fd;
  }
}


//
// Example 3
// User-level threads implementation of non-blocking read(),
// and corresponding modifications to thread scheduler.
// 

read(fd, buf, n) {
  // ask scheduler to run this thread when fd is readable
  current_thread->wait_fd = fd;
  current_thread->state = WAITING;
  thread_schedule();

  // now we can read without fear of blocking
  return real_read(fd, buf, n);
}

thread_schedule() {
  if(there are runnable threads){
    select() for wait_fds w/ timeout = 0;
  } else {
    select() for wait_fds w/ infinite timeout;
  }
  for each readable fd
    set waiting thread state to RUNNABLE;
  thread_switch() to a RUNNABLE thread;
}
//
// Example 4
// Top-level driver loop for event-driven programming library.
//

list<when, callback> timeouts;
callback fds[...];

amain() {
  while(1){
    select() for fds[] and earliest timeout;
    for each readable fd
      call fds[fd] callback
    if a timeout has expired
      delete it from timeouts list
      call its callback
  }
}

fdcb(fd, cb) {  // register cb to be called when fd is readable
  fds[fd] = cb;
}

delaycb(when, cb){ // register cb to be called at specified time
  push(timeouts, list(when, cb));
}

//
// Example 5
// Sample process/thread style code.
//

f1(fd){
  int x = ...;
  int y = f2(fd);
  printf("%d %d\n", x, y);
}

f2(fd) {
  int y;
  read(fd, &y, 4);  // read() might block
  y = y + 1;
  return(y);
}

//
// Example 6
// Above code transformed into event-driven style.
//

f1(fd){
  int x = ...;
  f2(fd, wrap(f1_cb, x));
}

f1_cb(x, y){
  printf("%d %d\n", x, y);
}

f2(fd, cb) {
  fdcb(fd, wrap(f2_cb, fd, cb));
}

f2_cb(fd, cb){
  int y;
  read(fd, &y, 4); // won't block
  y = y + 1;
  cb(y);
}
