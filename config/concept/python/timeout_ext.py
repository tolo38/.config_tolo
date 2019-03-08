import signal

# Register an handler for the timeout
def handler(signum, frame):
    print("Forever is over!")
    raise Exception("end of time")


# This function *may* run for an indetermined time...
def loop_forever():
    import time
    while 1:
        print("sec")
        time.sleep(1)
        
        

# Register the signal function handler
signal.signal(signal.SIGALRM, handler)

# Define a timeout for your function
signal.alarm(10)

try:
    loop_forever()
except Exception as exc: 
    print(exc)


import multiprocessing
import time

# bar
def bar():
    for i in range(100):
        print("Tick")
        time.sleep(1)

if __name__ == '__main__':
    # Start bar as a process
    p = multiprocessing.Process(target=bar)
    p.start()

    # Wait for 10 seconds or until process finishes
    p.join(10)

    # If thread is still active
    if p.is_alive():
        print("running... let's kill it...")

        # Terminate
        p.terminate()
        p.join()
