import React from 'react';
import { Logo } from './Logo';
import './App.css';

function App() {
  return (
    <div className="App">
      <Logo />
      <p>This site is temporarily unavailable.</p>
      <a
        className="App-link"
        href="https://github.com/ruedap/uhloop"
        target="_blank"
        rel="noopener noreferrer"
      >
        ruedap/uhloop
      </a>
    </div>
  );
}

export default App;
