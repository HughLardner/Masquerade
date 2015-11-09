package masquerade



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClanController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clan.list(params), model:[clanInstanceCount: Clan.count()]
    }

    def show(Clan clanInstance) {
        respond clanInstance
    }

    def create() {
        respond new Clan(params)
    }

    @Transactional
    def save(Clan clanInstance) {
        if (clanInstance == null) {
            notFound()
            return
        }

        if (clanInstance.hasErrors()) {
            respond clanInstance.errors, view:'create'
            return
        }

        clanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clan.label', default: 'Clan'), clanInstance.id])
                redirect clanInstance
            }
            '*' { respond clanInstance, [status: CREATED] }
        }
    }

    def edit(Clan clanInstance) {
        respond clanInstance
    }

    @Transactional
    def update(Clan clanInstance) {
        if (clanInstance == null) {
            notFound()
            return
        }

        if (clanInstance.hasErrors()) {
            respond clanInstance.errors, view:'edit'
            return
        }

        clanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clan.label', default: 'Clan'), clanInstance.id])
                redirect clanInstance
            }
            '*'{ respond clanInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clan clanInstance) {

        if (clanInstance == null) {
            notFound()
            return
        }

        clanInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clan.label', default: 'Clan'), clanInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clan.label', default: 'Clan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
