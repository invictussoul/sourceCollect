#include<stdlib.h>

#define  bool int 
#define  false 0
#define  true  1
#define  null  0
typedef struct _message 
{
   unsigned int  msgId;
   unsigned long msgLen;
   char * data[0];
}message;

typedef struct _message_queue
{
	unsigned int head ;
	unsigned int tail;
	unsigned int cap;
	unsigned int size;
	message * queue;

}msg_queue;

msg_queue * createMsgQ(unsigned int cap);
void   releaseMsgQ(msg_queue * q);
bool push(msg_queue *q ,message *m);
message * pop(msg_queue *q);
