const fs = require("fs");
const path = require("path");

const link = () => {
  eachSystemFile("system", (dotFile, systemFile) => {
    console.log(`${dotFile} => ${systemFile}`);
    makeDirectory(path.dirname(dotFile));
    linkFile(systemFile, dotFile);
  });
};

const eachSystemFile = (systemDir, callback) => {
  if (!fs.existsSync(systemDir)) return;

  fs.readdirSync(systemDir, { withFileTypes: true }).forEach((entry) => {
    const fullPath = path.join(systemDir, entry.name);
    if (entry.isFile() || fs.lstatSync(fullPath).isSymbolicLink()) {
      const relativeFile = withoutDirectory(fullPath, systemDir);
      const dotFile = homePath(dotify(relativeFile));
      const systemFile = path.resolve(fullPath);
      callback(dotFile, systemFile);
    }
  });
};

const withoutDirectory = (file, dir) => {
  return file.replace(dir + path.sep, "");
};

const dotify = (pathString) => {
  return path.join(
    ...pathString.split(path.sep).map((s) => s.replace(/^_/, "."))
  );
};

const homePath = (pathString) => {
  return path.join(process.env.HOME || process.env.USERPROFILE, pathString);
};

const makeDirectory = (dir) => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
};

const linkFile = (src, dest) => {
  if (!fs.existsSync(dest)) {
    fs.symlinkSync(src, dest);
  }
};

link();
