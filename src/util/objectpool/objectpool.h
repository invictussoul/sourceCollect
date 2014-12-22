#include <deque>

template <class T>
class ObjectPool
{
   public:
	  ObjectPool()
	  {

	  }

	  ~ObjectPool()
	  {

	  }

	  T* create()
	  {
		 if (m_deqFree.empty())
		 {
			T* pObject = new T;
			return pObject;
		 }
		 else
		 {
			T* pObject = m_deqFree.front();
			m_deqFree.pop_front();
			return pObject;
		 }
	  }

	  void release(T* pObject)
	  {
		 m_deqFree.push_front(pObject);
	  }

   private:
	  std::deque<T*> m_deqFree;
};

