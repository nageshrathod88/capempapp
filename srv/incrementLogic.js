const cds = require('@sap/cds');
const { message } = require('@sap/cds/lib/log/cds-error');

module.exports = cds.service.impl(async function() { 
    const { salaryWorkers } = this.entities;

    this.on('increaseSalary', async (req) => {
        const { ID } = req.data;
        if (!ID) {
            return req.error(400, "Worker ID is required");
         }

         console.log("Increasing salary for worker with ID:", ID);

        const tx = cds.transaction(req);

        try{
            // Retrive the current salary amount of the Worker
            const workers = await tx.run(
                SELECT.one.from(salaryWorkers).where({ ID })
            );

            if (!worker) {
                return req.reject(404, "Worker not found");
            }

            const currentSalary = workers[0].SALARYAMOUNT;
            console.log(`Current salary of Worker with ID ${ID} is ${currentSalary}`);

            // Perform the salary update
            const results = await tx.run(
                UPDATE(salaryWorkers)
                    .set({ SALARYAMOUNT: currentSalary + 5000 })
                    .where({ ID })
            );
            if (results < 1) {
                
                return req.reject(500, "Failed to update salary");
            }

            console.log(`Salary updated successfully for Worker with ID ${ID}`);

            
            // Fetch the updated worker record
            const updatedWorker = await tx.run(
                SELECT.one.from(salaryWorkers).where({ ID })
            );

           if (!updatedWorker) {
                return req.reject(500, "Failed to retrieve updated worker data");
            }

            await tx.commit();
            console.log(`Updated salary for Worker with ID ${ID}: ${updatedWorker.SALARYAMOUNT}`);


            return { message: "Salary incremented", Worker: updatedWorker };
            
        } catch(error) {
            // Rollback the transaction in case of error
            console.error("Error during hike action:", error);

            try {          
                 await tx.rollback();
            } catch (rollbackError){
                console.error("Rollback failed:", rollbackError);
            }
            return req.reject(500, "An error occurred: " + error.message);
        }
          
    });
    
 });