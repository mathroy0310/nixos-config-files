{
  programs.nixcord.quickCss = ''
      /**
     * @name gruvbox midnight (vencord)
     * @description A dark, grovee , discord theme. Based on Gruvbox's colour palette. (https://vencord.dev/)
     * @author refact0r, esme, anubis , save
     * @version 1.0
     * @invite nz87hXyvcy
     * @midnight_website https://github.com/refact0r/midnight-discord
     * @source https://github.com/refact0r/midnight-discord/blob/master/flavors/midnight-vencord.theme.css
     * @authorId 439438159840018443
     * @authorLink https://bio.savedsgn.com/
     */

    /* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

    @import url('https://refact0r.github.io/midnight-discord/midnight.css');

    /* customize things here */
    :root {
      /* font, change to 'gg sans' for default discord font */
      --font: 'JetBrains Nerd Mono';

      /* top left corner text */
      --corner-text: 'Gruvbox';

      /* color of status indicators and window controls */
      --online-indicator: #b8bb26; /* change to #23a55a for default green */
      --dnd-indicator: #cc241d;    /* change to #f13f43 for default red */
      --idle-indicator: #fabd2f;   /* change to #f0b232 for default yellow */

      /* accent colors */
      --accent-1: #7caea3;                            /* links */
      --accent-2: #fabd2f;                            /* general unread/mention elements */
      --accent-3: #d79921;                            /* accent buttons */
      --accent-4: #fabd2f;                            /* accent buttons when hovered */
      --accent-5: hsl(343.6, 46.7%, 61.6%);           /* accent buttons when clicked */
      --mention: hsla(343.6, 46.7%, 61.6%, 0.1);      /* mentions & mention messages */
      --mention-hover: hsla(343.6, 46.7%, 61.6%, 0.05); /* mention hover */

      /* text colors */
      --text-0: var(--bg-4);   /* text on colored elements */
      --text-1: var(--text-2); /* other normally white text */
      --text-2: #ebdbb2;       /* headings and important text */
      --text-3: #fbf1c7;       /* normal text */
      --text-4: #ad9e85;       /* icon buttons and channels */
      --text-5: #ad9e85;       /* muted channels/chats and timestamps */

      /* background and dark colors */
      --bg-1: rgb(28, 28, 28); /* dark buttons when clicked */
      --bg-2: rgb(28, 28, 28); /* dark buttons */
      --bg-3: rgb(28, 28, 28); /* spacing, secondary elements */
      --bg-4: #2c2c2c;         /* main background color */
      --hover: rgba(160, 130, 120, 0.1);   /* hover state */
      --active: rgba(160, 130, 120, 0.2);  /* active state */
      --message-hover: hsla(0, 0%, 0%, 0.1); /* message hover */

      /* amount of spacing and padding */
      --spacing: 12px;

      /* animations */
      /* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
      --list-item-transition: 0.2s ease;
      --unread-bar-transition: 0.2s ease;
      --moon-spin-transition: 0.4s ease;
      --icon-spin-transition: 1s ease;

      /* corner roundness (border-radius) */
      --roundness-xl: 10px;
      --roundness-l: 10px;
      --roundness-m: 10px;
      --roundness-s: 8px;
      --roundness-xs: 5px;
      --roundness-xxs: 5px;

      /* direct messages moon icon */
      --discord-icon: none;
      --moon-icon: block;
      --moon-icon-url: url('data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 27 27\' width=\'24\' height=\'24\'%3E%3Cpath fill=\'currentColor\' d=\'M0 0h7v1H6v1H5v1H4v1H3v1H2v1h5v1H0V6h1V5h1V4h1V3h1V2h1V1H0m13 2h5v1h-1v1h-1v1h-1v1h3v1h-5V7h1V6h1V5h1V4h-3m8 5h1v5h1v-1h1v1h-1v1h1v-1h1v1h-1v3h-1v1h-2v1h-1v1h1v-1h2v-1h1v2h-1v1h-2v1h-1v-1h-1v1h-6v-1h-1v-1h-1v-2h1v1h2v1h3v1h1v-1h-1v-1h-3v-1h-4v-4h1v-2h1v-1h1v-1h1v2h1v1h1v-1h1v1h-1v1h2v-2h1v-2h1v-1h1M8 14h2v1H9v4h1v2h1v1h1v1h1v1h4v1h-6v-1H5v-1H4v-5h1v-1h1v-2h2m17 3h1v3h-1v1h-1v1h-1v2h-2v-2h2v-1h1v-1h1m1 0h1v3h-1v1h-2v-1h1v-1h1\'%3E%3C/path%3E%3C/svg%3E');
      --moon-icon-size: cover;

      /* filter uncolorable elements to fit theme */
      --login-bg-filter: none;
      --green-to-accent-3-filter: none;
      --blurple-to-accent-3-filter: none;
    }

    /* disable DM spin */
    .wrapper__8436d:hover > .childWrapper_a6ce15::before,
    .wrapper__8436d.selected_ae80f7 > .childWrapper_a6ce15::before {
      background: var(--text-0);
      transform: rotate(0deg) scale(0.8);
    }
  '';
}
