package util
{
	public class Heapq
	{
		private var heapq:Array;
		
		public function Heapq()
		{
			heapq = new Array();	
		}
		public function push(v:int):void
		{
			heapq.push(v);
			_shifDown();
		}
		public function pop():int
		{
			var ret:int = heapq[0];
			_shifUp();
			heapq.pop();
			return ret;
		}
		private function _shifDown():void
		{
			
			var end_pos:int = 0;
			var child_pos:int = heapq.length - 1;
			var parent_pos:int =(child_pos -1)/2;
			var left_child_pos:int = (parent_pos+1)*2-1;
			var right_child_pos:int;
		
			while(left_child_pos > end_pos)
			{
				right_child_pos = left_child_pos+1;
				if(heapq[left_child_pos]<heapq[right_child_pos])
				{
					child_pos = right_child_pos;
				}else
				{
					child_pos =  left_child_pos;
				}
				if(heapq[parent_pos]<heapq[child_pos])
				{
					var tmp:int = heapq[child_pos];
					heapq[child_pos]=heapq[parent_pos];
					heapq[parent_pos]=tmp;
					left_child_pos = parent_pos;
					parent_pos = (left_child_pos -1)/2;
	 				
				}else
				{
					break;
				}
			}
		}
		private function _shifUp():void
		{
			var parent_pos:int = 0;
			var lastV:int = heapq[heapq.length-1];
			var end_pos:int = heapq.length -1;
			var left_child_pos:int = (parent_pos+1)*2-1;
			var right_child_pos:int;
			var child_pos:int;
			while(left_child_pos <= end_pos)
			{
				right_child_pos = left_child_pos+1;
				if(right_child_pos<=end_pos&&heapq[left_child_pos]<heapq[right_child_pos])
				{
					heapq[parent_pos] = heapq[right_child_pos];
					parent_pos = right_child_pos;
				}else 
				{
					heapq[parent_pos] = heapq[left_child_pos];
					parent_pos = left_child_pos;
				}
				left_child_pos = (parent_pos+1)*2-1;
			}
			heapq[parent_pos] = lastV;
		}
		public function print():void
		{
			for each(var i:int in heapq)
			{
				trace(i);
			}
		}
		public function length():int
		{
			return heapq.length;
		}
	}
	
}