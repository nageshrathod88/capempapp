const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    // Access the worker entity
    const { highWorkers } = this.entities;

    // Implement the function to fetch the highest salary
    this.on('getHighestSalary', async (req) => {
        try {
            // Query the highest salary from the worker entity
            const result = await cds.tx(req).run(
                SELECT.one.from(highWorkers)
                    .columns('SALARYAMOUNT')
                    .orderBy({ SALARYAMOUNT: 'desc' })  // Sort in descending order
            );

            if (!result) {
                return req.reject(404, "No workers found.");
            }

            // Return the highest salary found
            return result.SALARYAMOUNT;
        } catch (error) {
            console.error("Error fetching highest salary:", error);
            console.error("Error fetching highest salary from Mater Dev:", error);
            return req.reject(500, "An error occurred: " + error.message);
        }
    });
});
