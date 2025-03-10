const cds = require('@sap/cds');
const {worker} = cds.entities("epm.db.master");

const NewCQLService = function(srv){

    srv.on("READ","readWorker", async(req,res)=>{
            var results = [];
            results = await cds.tx(req).run(SELECT.from(worker).where({"FIRSTNAME":"John"}))
            return results;
    })

    // Inserting data in table whatever is passed in payload
    srv.on("CREATE", "insertWorker", async(req,res)=>{

        let returnData = await cds.transaction(req).run([
            INSERT.into(worker).entries(req.data)

        ]).then((resolve, reject)=> {
            if (typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500, "There was an error")
            }
        }).catch(err => {
              req.error(500, "Below error occured" + err.toString());  
        });
        
        return returnData;
    });

      // Updating data in table whatever is passed in payload
      // Update worker record
    srv.on("UPDATE", "updateWorker", async (req, res) => {
        try {
            let updatedData = await cds.transaction(req).run(
                UPDATE(worker)
                    .set({
                        FIRSTNAME: req.data.FIRSTNAME,
                        LASTNAME: req.data.LASTNAME
                    })
                    .where({ ID: req.data.ID }) // Make sure ID is sent in request payload
            );

            return updatedData ? req.data : req.error(500, "Error updating data.");
        } catch (err) {
            req.error(500, "Error: " + err.toString());
        }
    });
    // Delete worker record
    srv.on("DELETE", "deleteWorker", async (req, res) => {
        try {
            let deletedData = await cds.transaction(req).run(
                DELETE.from(worker).where({ ID: req.data.ID }) // Ensure ID is provided
            );

            return deletedData ? { message: "Record deleted successfully" } : req.error(500, "Error deleting data.");
        } catch (err) {
            req.error(500, "Error: " + err.toString());
        }
    })
}
module.exports = NewCQLService;