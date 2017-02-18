# toy_robot
A ruby console app to play with a toy robot.

Valid Commands to the Robot

PLACE  X,Y,F
MOVE  
LEFT  
RIGHT  
REPORT  

`PLACE`  will  put  the  toy  robot  on  the  table  in  positon  X,Y  and  facing  NORTH,  
SOUTH,  EAST  or  WEST

The  first  valid  command  to  the  robot  is  a  `PLACE`  command,  afer  that,  any  
sequence  of  commands  may  be  issued,  in  any  order,  including  another  `PLACE`  
command.  The  applicaton  should  discard  all  commands  in  the  sequence  until  a  
valid  `PLACE`  command  has  been  executed.  

`MOVE`  will  move  the  toy  robot  one  unit  forward  in  the  direction  it  is  currently  
facing.  
`LEFT`  and  `RIGHT`  will  rotate  the  robot  90  degrees  in  the  specified  direction  
without  changing  the  position  of  the  robot.  

`REPORT`  will  announce  the  X,Y  and  F  of  the  robot.  This  can  be  in  any  form,  but  
standard  output  is  sufficient. 

Environment

OS -> Ubuntu 16.04 LTS x86_64

Ruby Version -> ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-linux]
