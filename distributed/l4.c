/*
 * Example 1: linked list insert.
 */

struct List {
  int data;
  struct List *next;
};

insert(List **head, int data) {
  List *l = new List;
  l->data = data;
  l->next = *head;
  *head = l;
}

List *the_list = 0;

fn() {
  insert(&the_list, 100);
}

main() {
  thread_create(..., fn);
  thread_create(..., fn);
  thread_schedule();
}

/*
 * Example 2: Insert with busy-waiting.
 */

int insert_lock = 0;

insert(List **head, int data) {

  /* acquire the lock: */
  while(TestAndSet(&insert_lock) != 0)
    ;

  /* critical section: */
  List *l = new List;
  l->data = data;
  l->next = *head;
  *head = l;

  /* release the lock: */
  insert_lock = 0;
}

/*
 * Set *p to 1, then return the previous value of *p.
 * p is the address of a lock, so *p is the lock itself.
 */
int
TestAndSet(int *addr) {
  int ret = *addr;
  *addr = 1;
  return(ret);
}

/*
 * Example 3: acquire() and release() with test-and-set-locked.
 */

struct Lock {
  unsigned int locked;
};

acquire(Lock *l) {
  while(TestAndSetLocked(&(l->locked)) != 0)
    ;
}

release(Lock *l) {
  l->locked = 0;
}

#ifdef i386
int
TestAndSetLocked(int *addr)
{
  register int content = 1;
  asm volatile ("xchgl %0,%1" :
                "=r" (content),
                "=m" (*addr) :
                "0" (content),
                "m" (*addr));
  return(content);
}
#endif

/*
 * Example 4: producer and consumer.
 */

char buffer;
int full = 0;

producer() {
  while(1){
    ch = produce_byte();
    while(full)
      sleep();
    buffer = ch;
    full = 1;
    wakeup(consumer_thread);
  }
}

consumer() {
  while(1){
    while(full == 0)
      sleep();
    ch = buffer;
    full = 0;
    wakeup(producer_thread);
    consume_byte(ch);
  }
}

/*
 * Library routines.
 */
sleep() {
  current_thread->state = WAITING;
  thread_schedule();
}

wakeup(thread_p thread) {
  thread->state = RUNNABLE;
}

/*
 * Example 5: condition variable implementation.
 */

struct Condition {
  thread_p waiter;
};

wait(Condition *c, Lock *l) {
  thread_p p = current_thread;
  c->waiter = p;
  p->state = WAITING;
  release(l);
  thread_schedule();
  acquire(l);
}

signal(Condition *c) {
  if(c->waiter){
    c->waiter->state = RUNNABLE;
  }
}

/*
 * Example 6: producer/consumer using a condition variable.
 */

char buffer;
int full = 0;
Lock *lock = new Lock;
Condition *c = new Condition;

producer() {
  while(1){
    ch = produce_byte();
    acquire(lock);
    while(full)
      wait(c, lock);
    buffer = ch;
    full = 1;
    signal(c);    
    release(lock);
  }
}

consumer() {
  while(1){
    acquire(lock);
    while(full == 0)
      wait(c, lock);
    ch = buffer;
    full = 0;
    signal(c);
    release(lock);
    consume_byte(item);
  }
}
