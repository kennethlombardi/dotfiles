const fs = require("fs");
const path = require("path");

const link = () => {
  const root = "./system";
  forEachInDirectory(root, root, (source, destination) => {
    if (path.dirname(destination) !== homePath("")) {
      makeDirectoryIfNotExists(path.dirname(destination));
    }
    linkFile(source, destination);
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
      const originalPath = replaceUnderscoreWithDot(currentEntryPath);
      const oldPart = rootPath;
      const newPart = homePath("");
      const replaced = replacePath(originalPath, oldPart, newPart);
      const wholePath = path.join(
        replaced,
        replaceUnderscoreWithDot(entry.name)
      );
      callback(path.join(path.resolve(entry.path), entry.name), wholePath);
    }

    if (entry.isDirectory()) {
      const path = `${entry.path}/${entry.name}`;
      forEachInDirectory(rootPath, path, callback);
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

const replaceUnderscoreWithDot = (pathString) => {
  return path.join(
    ...pathString.split(path.sep).map((s) => s.replace(/^_/, "."))
  );
};

const homePath = (pathString) => {
  return path.join(process.env.HOME || process.env.USERPROFILE, pathString);
};

const ALREADY_EXISTS_WARNING =
  "EEXIST: File already exists. Move target before running again";

const makeDirectoryIfNotExists = (dir) => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  } else {
    console.log(dir, ALREADY_EXISTS_WARNING);
  }
};

const linkFile = (source, destination) => {
  if (!fs.existsSync(destination)) {
    fs.symlinkSync(source, destination);
  } else {
    console.log(destination, ALREADY_EXISTS_WARNING);
  }
};

link();
