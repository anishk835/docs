## Memory efficient Java code

1. Simple Integer object create 4 times the size of operatiing system OS.
   e.g. ``` Integer integer = new Integer(10)```, In this example it create 128 bit on 32 bit OS
2. Whenever you need a single character for a class try to create char rather than String.
   e.g. ``` String string = new String("myString")```, this create another object which is character array which store the actual data.
3. Compressed object refrence should be enabled in the 64 bit OS.
4. The more GC run will slower the application running.
5. Right choice for right collection.
6. Heap: clean up done GC.
7. Dangling pointer bug: a case where a pointer still pointing to the old place (unpredictable return) freeing up memory twice. There is no pointer reference.

#### Heap size and relation to GC:
1. size of the heap influence GC.
2. smaller heap means that GC needs to happen more often (due to too small heap impact performance)
3. when heap size is to big, then full GC can take place long 
time.
4. heap size depends upon application, less that 5% of the execution time should be GC

#### Sweeping Methods:
1. Normal sweep
2. sweel with compacting
3. sweep with copy

#### Metric for GC:
1. Allocation rate
2. Heap population
3. Mutation rate
4. Object life span
5. Mark time
6. Compaction time
7. GC cycle time

#### Notes:
1. Less memory leads to increased CPU.
2. Copy and compact collector need more space.
3. Better GC can do the job with more space.

#### Avoid memory leaks:
1. Set the object to null in certain specific situation
2. Close resources such as streams and connections
3. Avoid string concats; use string builder instead
4. Careful with static collections holding objects
5. Overwrite hashcode and equals(especially when custom objects get added to hash sets)

## In Java 8

1. Java has refrence type (Integer, Byte etc) and primitive type (int, byte) and only reference type is bounded to generic type (T) in Java.
2. Java has auto boxing and un-boxing but it comes with a cost of storing boxed oject in the heap and consumes more memory. and required additional lookup to fetch wraped primitive value.

