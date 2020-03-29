import React from "react";
import styled from "styled-components";

const Styled = styled.div`
  background-color: blue;
  background-size: contain;
  width: 100 % ;
  height: 100 % ;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  position: absolute;
`

class Users extends React.Component {
  render() {
    return (
      <Styled>
      <div>
        <h1>Users</h1>
        <ul style={{backgroundColor: 'green'}}>
          {this.props.users.map(user => (
            <li key={user.id}>
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
        </ul>
      </div>
      </Styled>
    );
  }
}
export default Users
