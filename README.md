# open-browser-rustdoc.vim

## About

Opens Rustdoc URL for current crate, standard library, etc. from Vim.

## Install

This plugin requires:

* [open-browser.vim](https://github.com/tyru/open-browser.vim)

Use your favorite plugin manager to install this plugin and all its lua dependencies.

<details>
<summary>Expand lazy.nvim snippet: </summary>

```lua
{
    "rogercoll/open-browser-rustdoc.vim",
    dependencies = {
        "tyru/open-browser.vim", -- Required
    },
    lazy = false,
}
```

</details>


## Usage

There are 2 commands.

### `:OpenRustDocCrate`

Opens a specific crate documentation in docs.rs.

```vimL
" Opens anyhow latest crate's documentation in docs.rs.
:OpenRustDocCrate anyhow
" Opens anyhow version 1.0.0 crate's documentation in docs.rs.
:OpenRustDocCrate anyhow 1.0.0
```

### `:OpenRustDocStd`

Opens Rust standard library in doc.rust-lang.org/std/.

```vimL
:OpenRustDocStd
```

### `:OpenRustDocReleases`

Opens https://releases.rs/docs/.

```vimL
:OpenRustDocReleases
```

## WIP

### `:OpenRustDoc`

Opens the underlying Rust module in docs.rs.

Tracking issue: https://github.com/rogercoll/open-browser-rustdoc.vim/issues/1

## TODO

- [] Open any arbitrary Rust data structure documentation.
