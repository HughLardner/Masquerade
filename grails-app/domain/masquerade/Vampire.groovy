package masquerade

class Vampire {

	String forename, surname, name
	Clan clan
	String title
	Boolean active
	
	static hasMany = [owedTo:Boon, owedFrom:Boon]
    static constraints = {
    }
	
	static mapping = {
		sort 'forename'
	}
	String toString(){
		return (title?title+ " ":"")  + (forename?forename+ " ":"")  +(surname?surname+ " ":"")  + (clan?" of clan "+clan:"")
	}
}
