package masquerade

class Category {

	String category
    static constraints = {
    }
	static mapping = {
		sort "id"
	}
	
	String toString(){
		return category
	}
}
