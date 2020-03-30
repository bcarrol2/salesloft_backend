import React from "react";
import styled from "styled-components";

// const Styled = styled.div`
//   background-color: blue;
//   background-size: contain;
//   width: 100 % ;
//   height: 100 % ;
//   top: 0;
//   left: 0;
//   right: 0;
//   bottom: 0;
//   position: absolute;
// `

class Users extends React.Component {
  render() {
    return (
      // <Styled>
      <div>
        <div className="profile-container">
          <h1>Hey Kyle</h1>
        </div>
        <ol className="users-list-container">
          {this.props.users.map(user => (
            <li id="single-user-listed" key={user.id}>
              Name: {user.first_name} {user.last_name}
              <br />
              Email: {user.email}
              <br />
              Phone Number: {user.phone_number}
              <details>
                <summary>Money Spent with the company</summary>
                <p>${user.money_spent}</p>
              </details>
            </li>
          ))}
        </ol>
      </div>
      // </Styled>
    );
  }
}
export default Users
