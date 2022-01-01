import { useState, useEffect } from 'react'
import logo from './images/logo.svg'
import k8s from './images/k8s.png'
import docker from './images/docker.png'
import nginx from './images/nginx.png'
import tf from './images/tf.png'
import azure from './images/azure.png'
import './App.css'
import axios from 'axios'

function App() {
  const [me, setMe] = useState({ name: '', bio: '', link: '' })
  const [v, setV] = useState(0)

  useEffect(() => {
    axios.get('/api/genius').then(res => setMe(res.data))
    axios.get('/api/version').then(res => setV(res.data))
  }, [])


  return (
    <div className='App'>
      <header className='App-header'>
      <div className='images'>
        <img src={logo} className='App-logo' alt='logo' />
        <img src={docker} className='App-logo' alt='logo' />
        <img src={tf} className='App-logo' alt='logo' />
        <img src={azure} className='App-logo' alt='logo' />
        <img src={k8s} className='App-logo' alt='logo' />
        <img src={nginx} className='App-logo' alt='logo' />
      </div>
        <p>Sample React app using docker, k8s, terraform and only God knows what else</p>
        <p>Version: 1.0.{v} - try refreshing, there should be 4 pods ❤️</p>
        <h3 style={{ marginBottom: 20, marginTop: 0, paddingBottom: 0 }}>By</h3>
        <h4 style={{ marginBottom: 10, marginTop: 0, paddingBottom: 0, color: 'green' }}>
          {me.name}
        </h4>
        <h5 style={{ marginBottom: 10, marginTop: 0, paddingBottom: 0, color: 'green' }}>
          {me.bio}
        </h5>
        <code>
          <a
            className='App-link'
            href={me.link}
            target='_blank'
            rel='noreferrer'
          >
            -- github --
          </a>
        </code>
        <code style={{ fontSize: 14 }}>Green text color is from api, if there is none, sorry. 😭</code>
      </header>
    </div>
  )
}

export default App
