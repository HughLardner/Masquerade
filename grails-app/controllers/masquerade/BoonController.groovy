package masquerade



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BoonController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Boon.list(params), model:[boonInstanceCount: Boon.count()]
	}

	def show(Boon boonInstance) {
		respond boonInstance
	}

	def create() {
		respond new Boon(params)
	}

	@Transactional
	def save(Boon boonInstance) {
		if (boonInstance == null) {
			notFound()
			return
		}

		if (boonInstance.hasErrors()) {
			respond boonInstance.errors, view:'create'
			return
		}

		boonInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'boon.label', default: 'Boon'),
					boonInstance.id
				])
				redirect boonInstance
			}
			'*' {
				respond boonInstance, [status: CREATED]
			}
		}
	}

	def edit(Boon boonInstance) {
		respond boonInstance
	}

	@Transactional
	def update(Boon boonInstance) {
		if (boonInstance == null) {
			notFound()
			return
		}

		if (boonInstance.hasErrors()) {
			respond boonInstance.errors, view:'edit'
			return
		}

		boonInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Boon.label', default: 'Boon'),
					boonInstance.id
				])
				redirect boonInstance
			}
			'*'{
				respond boonInstance, [status: OK]
			}
		}
	}

	@Transactional
	def delete(Boon boonInstance) {

		if (boonInstance == null) {
			notFound()
			return
		}

		boonInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Boon.label', default: 'Boon'),
					boonInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'boon.label', default: 'Boon'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def showBoonList(){
		Boolean showhidden = params.get("hidden")
		def vampiresActive = Vampire.findAllByActive(true)
		def vampiresAll = Vampire.list()

		def boonList = [:]
		for(def vampire:vampiresActive){
			
			def newBoonsOwes = []
			def newBoonsOwed = []
			def vampMap = ['owes':newBoonsOwes, 'owed':newBoonsOwed ]

			boonList.putAt(vampire,vampMap)
			for(def vam:vampiresAll){
				def newOwes = Boon.withCriteria {
					eq('vampire', vampire)
					eq('owedTo', vam)
					or{
						eq('hidden', false)
						eq('hidden', showhidden)
					}
					and {
						order('owedTo', 'asc')
						order('category', 'desc')
					}
					projections {
						groupProperty  ('vampire')
						groupProperty('owedTo')
						groupProperty('category')
						countDistinct "id",'mycount'
					}
				}

				def newOwed = Boon.withCriteria {
					eq('owedTo', vampire)
					eq('vampire', vam)

					or{
						eq('hidden', false)
						eq('hidden', showhidden)
					}
					and {
						order('vampire', 'asc')
						order('category', 'desc')
					}
					projections {
						groupProperty  ('vampire')
						groupProperty('owedTo')
						groupProperty('category')
						countDistinct "id",'mycount'
					}
				}



				def catOwnes = [:]
				def catOwed = [:]
				newOwes.collect {
					if(it[3] >0){
						catOwnes.putAt(it[2].toString(), it[3])
					}
				}
				newOwed.collect {
					if(it[3] >0){
						catOwed.putAt(it[2].toString(), it[3])
					}
				}
				if(catOwnes.size() > 0){
					newBoonsOwes.add([("${vam}"): catOwnes])
				}
				if(catOwed.size() > 0){
					newBoonsOwed.add([("${vam}"): catOwed])
				}
			}

		}

		render(view:"showBoonList", model:['boonList':boonList]);
		//render boonList as JSON

	}
	
	def showBoonForVampire(Vampire vampire){
		List boonList = Boon.findAllByVampire(vampire, params)
		boonList.addAll(Boon.findAllByOwedTo(vampire, params))
		
		render(view:"index", model:['boonInstanceList':boonList,boonInstanceCount: boonList.size()]);
				
	}
	
	def printBoonBook(){
		def vampiresActive = Vampire.findAllByActive(true)
		def boons = Boon.findAllByHiddenAndOwedToInList(false,vampiresActive)
		def boonList = [:]
		vampiresActive.each {
			boonList.put(it, [])
		}
		boons.each {
			boonList.get(it.owedTo).add(it)
		}
		render (view: "printBoonBook", model:['boons':boonList])
	}
}
