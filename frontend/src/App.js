import { useState, useEffect } from 'react'
import logo from './images/logo.svg'
import k8s from './images/k8s.png'
import docker from './images/docker.png'
import nginx from './images/nginx.png'
import './App.css'
import axios from 'axios'

function App() {
  const [me, setMe] = useState({ name: '', bio: '', link: '' })

  useEffect(() => {
    axios.get('http://localhost:3010/genius').then(res => setMe(res.data))
  }, [])

  return (
    <div className='App'>
      <header className='App-header'>
      <div className='images'>
        <img src={logo} className='App-logo' alt='logo' />
        <img src={k8s} className='App-logo' alt='logo' />
        <img src={docker} className='App-logo' alt='logo' />
        <img src={nginx} className='App-logo' alt='logo' />
      </div>
        <p>Sample React app using docker, k8s and only God knows what else</p>
        <h3 style={{ marginBottom: 20, marginTop: 0, paddingBottom: 0 }}>By</h3>
        <h4 style={{ marginBottom: 10, marginTop: 0, paddingBottom: 0 }}>
          {me.name}
        </h4>
        <h5 style={{ marginBottom: 10, marginTop: 0, paddingBottom: 0 }}>
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
      </header>
    </div>
  )
}

export default App
