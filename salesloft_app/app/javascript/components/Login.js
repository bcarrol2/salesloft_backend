import React from "react"

// unused component view rendered from rails devise

class Login extends React.Component {
  constructor(props){
    super(props)

    this.state = {
      email: '',
      password: ''
    }

    this.inputRef = React.createRef()
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  componentDidMount(){
    this.inputRef.current.focus()
  }

  handleChange(e){
    this.setState({
      [e.target.name]: e.target.value
    })
  }

  handleSubmit(){
    const url = "http://localhost:3000/"
    const { email, password } = this.state;
    const body = {
      email,
      password
    }

    if (email.length === 0 || password.length === 0)
    return;

    fetch(url, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
    .then(response => {
          return response.json();
      })
      .then(payload => {
        localStorage.setItem("token", payload.token)
      })
      .then(window.location.href = "/users")
      .catch(error => console.log(error.message));
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
                    <form onSubmit={this.handleSubmit}>
                        <h2 style={{ color: 'grey' }}>Account</h2>
                        <input className="inputBox" 
                        type="text" 
                        name="email" 
                        ref={this.inputRef} 
                        onChange={this.handleChange} 
                        value={this.state.email} 
                        placeholder="Email">
                        </input>
                        <input className="inputBox" 
                        type="password" 
                        name="password" 
                        onChange={this.handleChange} 
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
export default Login;