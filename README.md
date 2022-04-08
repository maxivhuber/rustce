# rustce
## Explore Rust Assembler
Instructions to install and setup [Compiler Explorer](https://github.com/compiler-explorer/compiler-explorer) on your machine *with* support
for external crates.

### 1. Open your terminal and change into some directory of your choice, execute:
```bash
git clone https://github.com/compiler-explorer/compiler-explorer.git
cp compiler-explorer/etc/config/rust.defaults.properties compiler-explorer/etc/config/rust.local.properties
cargo install rustfilt
```
### 2. Edit compiler-explorer/etc/config/rust.local.properties
```
compilers=/PATH/TO/rustc
demangler=/PATH/TO/rustfilt
```
### 3. Build the website (**make sure to install nodejs and npm beforehand!**)
```bash
cd compiler-explorer
make
```
### 4. Get rlib files (if you need external crates)
```bash
bash <script> <git repo> <target_dir>
bash extract_rlib.sh https://github.com/rayon-rs/rayon.git ./libs
```
### 5. Open the website and point rustc to <target_dir> (rustc command-line arguments)
```
 -L all=/PATH/TO/<target dir>
```
 
