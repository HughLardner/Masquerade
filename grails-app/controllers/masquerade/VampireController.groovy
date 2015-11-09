package masquerade



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VampireController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vampire.list(params), model:[vampireInstanceCount: Vampire.count()]
    }

    def show(Vampire vampireInstance) {
        respond vampireInstance
    }

    def create() {
        respond new Vampire(params)
    }

    @Transactional
    def save(Vampire vampireInstance) {
        if (vampireInstance == null) {
            notFound()
            return
        }

        if (vampireInstance.hasErrors()) {
            respond vampireInstance.errors, view:'create'
            return
        }

        vampireInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vampire.label', default: 'Vampire'), vampireInstance.id])
                redirect vampireInstance
            }
            '*' { respond vampireInstance, [status: CREATED] }
        }
    }

    def edit(Vampire vampireInstance) {
        respond vampireInstance
    }

    @Transactional
    def update(Vampire vampireInstance) {
        if (vampireInstance == null) {
            notFound()
            return
        }

        if (vampireInstance.hasErrors()) {
            respond vampireInstance.errors, view:'edit'
            return
        }

        vampireInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vampire.label', default: 'Vampire'), vampireInstance.id])
                redirect vampireInstance
            }
            '*'{ respond vampireInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vampire vampireInstance) {

        if (vampireInstance == null) {
            notFound()
            return
        }

        vampireInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vampire.label', default: 'Vampire'), vampireInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vampire.label', default: 'Vampire'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def active(){
		def vampires = Vampire.findAllByActive(true)
		render vampires as JSON
	}
}
