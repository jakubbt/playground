const express = require('express')
const cors = require('cors')

const app = express()

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.get('/', (req, res) => {
  res.send('Just kidding')
})

app.get('/genius', (req, res) => {
  res.send({
    name: 'Jakub',
    bio: 'Unknown waters enthusiast',
    link: 'https://github.com/jakubbt'
  })
})

app.listen('3010', () => {
  console.log('Listening on 3010')
})
