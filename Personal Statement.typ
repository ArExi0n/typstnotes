#set page(paper: "us-letter", margin: (x: 1.2in, y: 1in))
#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): it => {
  v(1em)
  text(size: 16pt, weight: "bold", it.body)
  v(0.4em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 15pt, weight: "bold", it.body)
  v(0.3em)
}

= Personal Statement

I broke my computer 37 times, but my father appreciated me for it.

Every time I typed `rm -rf . ` from the root directory, it felt as if my soul were being ripped from my body. When I entered the BIOS settings afterward, I wanted to undo everything and return to the comfort zone I’d known for the past seven years, a zone filled with bloated software I never asked for, full of discomfort that restricts my freedom, yet it tells me I’m free to roam within those limits like a prisoner who knows only the shadows on the cave wall.

Seven times.

I rebuilt my Hyprland configuration seven times, and each time my AMD GPU found another way to make it collapse. Each time I stared at the black screen, wondering why my GPU drivers can't cooperate with my Hyprland display, which forced me to stare at the terminal for five minutes to type cd .config/hyprland && nvim ..

Still, I kept returning to Linux. Its freedom meant I could shape my computer around my ideas rather than shape my ideas around someone else’s software. But that freedom came with a cost: every choice was mine to understand, and every mistake was mine to fix.

A black screen was no longer just a failed configuration; it was a question I hadn't learned to answer yet.

At this point, my .config had become a garden of forking paths, every Lua file opening another route toward the dotfiles setup I imagined.


