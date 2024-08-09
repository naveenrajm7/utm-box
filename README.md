# UTM box

Packer templates to build Vagrant compatible UTM boxes,
which can be used with Vagrant using [Vagrant UTM plugin](https://naveenrajm7.github.io/vagrant_utm)

Check [HowToBuild](./HowToBuild/DebianUTM.md) to get started.

## Differences from Bento

Because bento scripts are built to work with other builders, 
using the same scripts for UTM might cause issues.
For example, the cleaup script which removes unwanted packages (for other builders),
removed the ```isc-dhcp-client``` which is needed for UTM.
Hence, we only do what is necessary for Vagrant and UTM.
Other box reduction techniques can be incorporated later keeping UTM in mind.


## Difference from ISO

The UTM Gallery VM has all essential packages to work with all features.
Namely, directory sharing, port-forwarding, clip-board sharing.
All these packages should be installed during the minimal auto installation.

