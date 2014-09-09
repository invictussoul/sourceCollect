#include<stdlib.h>
#include<assert.h>
#include"cricleQueue.h"

msg_queue * createMsgQ(unsigned int cap)
{
	msg_queue *q = (msg_queue *)malloc(4*sizeof(unsigned int)+cap*sizeof(message));
	q->cap = cap;
	q->head=0;
	q->tail=0;
    q->size=0;
	q->queue=(message*)(q+4*sizeof(unsigned int));
	return q;
}
void releaseMsgQ(msg_queue * q)
{
	assert(q);
	assert(q->queue);
	free(q->queue);
	free(q);
	q->queue=NULL;
	q=NULL;
}
bool push(msg_queue *q ,message *m)
{
	assert(q&&m);
	if(q->size<q->cap)
	{
		q->queue[q->tail]=*m;
		q->tail=(q->tail+1)%q->cap;
		q->size++;
		free(m);
		return true;
	}
	else 
	{
		//over follow
		return false;
	}

}
message * pop(msg_queue *q)
{
	assert(q);
	if(q->size!=0)
	{
		message* m = &(q->queue[q->head]);
		q->head=(q->head+1)%q->cap;
	    q->size--;
		return m;
	}else 
	{
		//empty
		return null;
	}
}
