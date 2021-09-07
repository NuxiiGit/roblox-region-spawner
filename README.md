# roblox-region-spawner

A simple example project for spawning ball particles within a region defined by two control points.

## Usage

Create two parts named `BoxStart` and `BoxEnd` and group them together. The group can be called anything you want, but a good name might be `MessGroup`. Then add a new script called `MessScript` to the group and include the code within the [`src.lua`](./src.lua) file.

Your resource tree should look something like:
```text
Workspace
|- MessGroup
   |- MessScript
   |- BoxStart
   |- BoxEnd
```
