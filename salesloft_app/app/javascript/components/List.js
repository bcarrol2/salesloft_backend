import React from 'react';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import { FixedSizeList } from 'react-window';

function renderRow(props) {
  const mappedUsers = props.users.map(user => (
  <ListItem button style={{backgroundColor: '#96c9f5', color: 'white'}} key={user.id}>
    <ListItemText primary={
    <p>
    Name: {user.first_name} {user.last_name}
    <br />
    Email: {user.email}
    <br />
    Phone Number: {user.phone_number}
    <br />
    Money Spent with the company: ${user.money_spent}
    </p>
    } 
  />
  </ListItem> ))

  return (<div>{mappedUsers}</div>);
}

export default function VirtualizedList(props) {
  return (
    <div>
      <FixedSizeList 
        style={{margin: '0 auto', borderRadius: '4px'}} 
        height={400} 
        width={700} 
        itemSize={70} 
        itemCount={props.users.length}>
        {() => renderRow(props)}
      </FixedSizeList>
    </div>
  );
}