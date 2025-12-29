import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.json({ 
        message: "Hello from a container!", 
        service: 'hello-node',
        pod: process.env.POD_NAME || 'unknown',
        time: new Date().toISOString(),
    });
});

//Here we can also add some basic health endpoints for the PODS:
app.get('/readyz', (req, res) => res.status(200).send('ready'));
app.get('/healthyz', (req,res) => res.status(200).send('ok')); 

app.listen(PORT, () => {
    console.log(`Example app listening on port ${PORT}!`)
})