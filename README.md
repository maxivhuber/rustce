# rustce
## Explore Rust Assembler
Instructions to install and setup [Compiler Explorer](https://github.com/compiler-explorer/compiler-explorer) on your machine *with* support
for externel crates.

1. open terminal and cd into some directory of your choice execute:
```bash
git clone https://github.com/compiler-explorer/compiler-explorer.git
git clone https://github.com/compiler-explorer/tools.git compiler-explorer-tools
cp compiler-explorer/etc/config/rust.defaults.properties compiler-explorer/etc/config/rust.local.properties
cargo build --manifest-path compiler-explorer-tools/rust/Cargo.toml -r
```
2. Edit compiler-explorer/etc/config/rust.local.properties
```
compilers=/PATH/TO/RUSTC
demangler=${ceToolsPath}/rust/target/release/rustfilt
```
3. Build the webside (**make sure to install nodejs and npm beforehand!**)
```
cd compiler-explorer
make
```
4. Get rlib files (if you need external crates)
```bash
bash <script> <git repo> <target dir>
bash extract_rlib.sh https://github.com/rayon-rs/rayon.git ./libs
```

### You can find rustc executing
```
which rustc
```
