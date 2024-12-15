const express = require('express');
const app = express();
const path = require('path');
const PORT = 3000;

app.get('/', (req, res) => {
  // res.send('Hello World!');
  res.sendFile(path.join(__dirname,"index.html"));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

