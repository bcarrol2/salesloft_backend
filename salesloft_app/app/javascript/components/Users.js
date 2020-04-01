import React from "react";
import List from './List';
import axios from 'axios';

class Users extends React.Component {
  constructor(props){
    super(props)

  }

  logoutUser = () => {
    const url = "http://localhost:3000/users/sign_out.json";
    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken
      axios.delete(url, {
        headers: {
          Authorization: csrfToken
        },
        data: {
          source: "user"
        }
      })
      .then(() => window.location.reload())
      .catch(error => console.log(error.message));
    }

  render() {
    let allUsers = this.props.users;
    return (
      <div>
        <div className="profile-container">
          <h2 style={{textDecoration: 'underline'}}>Hey {this.props.current_user_email}</h2>
          <div><h3>{this.props.email_comparison.length} Similar Emails</h3><p style={{color: 'black'}}>{this.props.email_comparison.join(", ")}</p></div>
          <div>
            <h3>Email Characters</h3>
            {this.props.email_data.map(letter_array => (
              <div id="email-characters"><p>{letter_array}</p></div>
            ))}
          </div>
          <button className="logoutButton" onClick={this.logoutUser}>Logout</button>
        </div>
        <List users={allUsers} />
      </div>
    );
  }
}
export default Users
