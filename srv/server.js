const cds = require("@sap/cds");
const cov2ap = require("@cap-js-community/odata-v2-adapter");


// Proxy to create OData V2 API Endpoints for our OData V4 service
cds.on("bootstrap", (app) => app.use(cov2ap()));
module.exports = cds.server;