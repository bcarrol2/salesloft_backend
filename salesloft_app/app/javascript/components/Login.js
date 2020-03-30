import React from "react"

class Login extends React.Component {
  constructor(){
    super()

    this.state = {
      email: '',
      password: ''
    }

    this.inputRef = React.createRef()
  }

  componentDidMount(){
    this.inputRef.current.focus()
  }

  render () {
    return (
      <div>
        <div className="split left">
          <div id="login-letters-box"><h1 id="moving-login-letter">S</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">A</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">L</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">E</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">S</h1></div>
          <br />
          <div id="login-letters-box"><h1 id="moving-login-letter">L</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">O</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">F</h1></div>
          <div id="login-letters-box"><h1 id="moving-login-letter">T</h1></div>
        </div>
        <div className="split right">
            <div className="loginForm">
                <div className="bottomLoginForm">
                    <form>
                        <h2 style={{ color: 'grey' }}>Account</h2>
                        <input className="inputBox" 
                        type="text" 
                        name="email" 
                        ref={this.inputRef} 
                        onChange={event => this.setState({ email: event.target.value })} 
                        value={this.state.email} 
                        placeholder="Username">
                        </input>
                        <input className="inputBox" 
                        type="text" 
                        name="password" 
                        onChange={event => this.setState({ password: event.target.value })} 
                        value={this.state.password} 
                        placeholder="Password">
                        </input>
                        <br />
                        <br />
                        <button className="loginButton" type="submit" value="Submit">Login</button>
                    </form>
                </div>
                <p>Don't have an account? <a href="/signup">Sign up</a></p>
            </div>
        </div>
      </div>
    );
  }
}

export default Login
