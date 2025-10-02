const fs = require("fs");
const path = require("path");

const link = () => {
  const root = "./root";
  forEachInDirectory(root, root, (source, destination) => {
    if (path.dirname(destination) !== homePath("")) {
      makeDirectoryIfNotExists(path.dirname(destination));
    }

    // if the file exists
    if (fs.existsSync(destination)) {
      // make a backup of the file
      const backup = `${destination}.bak`;
      fs.copyFileSync(destination, backup);
      console.log(`Created backup of ${destination} as ${backup}`);

      // delete the original
      fs.unlinkSync(destination);
    }
  });

  // spawn stow to link the files

  console.log("Linking files using stow");
  const { spawnSync } = require("child_process");
  const stow = spawnSync("stow", ["-vv", "--target", homePath(""), "root"], {
    stdio: ["inherit", "inherit", "inherit"],
  });
};

function forEachInDirectory(rootPath, currentEntryPath, callback) {
  const directoryExists = fs.existsSync(currentEntryPath);
  if (!directoryExists) {
    return;
  }

  const directory = fs.readdirSync(currentEntryPath, { withFileTypes: true });

  directory.forEach((entry) => {
    if (entry.isFile()) {
      const oldPart = rootPath;
      const newPart = homePath("");
      const replaced = replacePath(currentEntryPath, oldPart, newPart);
      const wholePath = path.join(replaced, entry.name);
      callback(path.join(path.resolve(currentEntryPath), entry.name), wholePath);
    }

    if (entry.isDirectory()) {
      const entryPath = path.join(currentEntryPath, entry.name);
      forEachInDirectory(rootPath, entryPath, callback);
    }
  });
}

function replacePath(originalPath, oldPart, newPart) {
  // Resolve the original path to get an absolute path
  const absoluteOriginalPath = originalPath;

  // Get the relative path from the old part to the original path
  const relativePath = path.relative(oldPart, absoluteOriginalPath);

  // Join the new part with the relative path
  const newPath = path.join(newPart, relativePath);

  return newPath;
}



const homePath = (pathString) => {
  return path.join(process.env.HOME || process.env.USERPROFILE, pathString);
};

const makeDirectoryIfNotExists = (dir) => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
};

link();
