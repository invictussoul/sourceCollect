package util
{
	public class WinTree
	{
		private var _values:Array;
		private var _winner:int;
		public function WinTree()
		{
			_values = new Array();
		}
//回归	
		public function push(v:int):void
		{ 
			_values.push(v);
			_winner = _caculate(0);
		}
		public function pop():int
		{
			var ret:int = _values[_winner]; 
			_values.splice(_winner,1);
			_winner = _caculate(0);
			return ret;
		}
		private function _caculate(pos:int):int
		{
			var winner:int ;
			var leftRet:int;
			var rightRet:int;
			var left_pos:int = (pos+1)*2-1;
			var right_pos:int = left_pos+1;
			if(left_pos<=_values.length-1)
			{
				leftRet = _caculate(left_pos);
				if(right_pos<=_values.length-1)
				{
					rightRet = _caculate(right_pos);
				}
				if(_values[rightRet]>_values[leftRet])
				{
					winner = rightRet;
				}else
				{
					winner  = leftRet;
				}
			}else 
			{
				winner=pos;
			}
			return winner;
		}
		public function length():int
		{
			return _values.length;
		}
		
	}
}