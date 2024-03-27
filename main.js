const express = require('express')
const app = express()
const PORT = process.env.PORT || 3000
app.get('/', (req,res)=>{
    return res.json({data : 'hello world'})
})
app.listen(PORT,()=>{
    console.log('listening on port 3000')
})