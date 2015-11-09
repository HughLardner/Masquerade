package masquerade

class Boon {

	Category category
	Boolean hidden
	Date dateCreated
	static hasMany = []
	static belongsTo = [vampire:Vampire, owedTo:Vampire]
	
    static constraints = {
    }
	
	String toString(){
		return vampire.toString() + " owes a " + category + " boon to " + owedTo
	}
}
