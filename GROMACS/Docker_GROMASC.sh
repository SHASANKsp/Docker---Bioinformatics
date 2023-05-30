#building the docker image
docker build -t <image_name>:<tag> .
#loading the image into the container and assining volume to assess the local files
docker run -it -v /path/to/local/files:/data <image_name>:<tag>
#goes into the local data folder
cd /data
#Making a combined GRO file
gmx pdb2gmx -f protein.pdb -merge ligand.pdb -o complex.gro -water spce
#diffning box and adding water
gmx editconf -f complex.gro -o newbox.gro -bt dodecahedron -d 1.0
gmx solvate -cp complex.gro -cs spc216.gro -o solvated.gro -p topol.top
#adding ions
gmx grompp -f ions.mdp -c solvated.gro -p topol.top -o ions.tpr
gmx genion -s ions.tpr -o solvated_ions.gro -p topol.top -pname NA -nname CL -neutral
#energy minimization
gmx grompp -f em.mdp -c solvated_ions.gro -p topol.top -o em.tpr
gmx mdrun -v -deffnm em
#make the index file and restrain the ligand
gmx make_ndx -f jz4.gro -o index_jz4.ndx
gmx genrestr -f jz4.gro -n index_jz4.ndx -o posre_jz4.itp -fc 1000 1000 1000
gmx make_ndx -f em.gro -o index.ndx
#NVT
gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr
gmx mdrun -v -deffnm nvt
#NPT
gmx grompp -f npt.mdp -c nvt.gro -t nvt.cpt -r nvt.gro -p topol.top -o npt.tpr
gmx mdrun -v -deffnm npt
#MD
gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -n index.ndx -o md_0_10.tpr
gmx mdrun -deffnm md