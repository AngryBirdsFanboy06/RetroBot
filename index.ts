import 'dotenv/config';
import { Client, Intents } from 'discord.js';
import * as fs from 'fs';

const eventsFolder = `${__dirname}/events/`;

const client = new Client({ intents: [Intents.FLAGS.GUILDS] });

// console.log(process.env)
// console.warn(__dirname)



// Iterate through all files in the events folder and run them
fs.readdirSync(eventsFolder).forEach(File  => {
    // Import the event file
    const event = require(`${eventsFolder}${File}`);
    // Run the event
    event.Run(client);
});

client.login(process.env.DiscordToken);