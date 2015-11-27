This page is intended for Tutorial participants who would like to setup an own environment with Radical-Pilot, SAGA-Hadoop and the Hadoop/Spark tools.

# Anaconda (with Python2)

* https://www.continuum.io/downloads

        $ conda update conda
        $ conda install jupyter
        $ conda install ipython

# SAGA-Hadoop

    pip install --upgrade saga-hadoop

# Hadoop:

* Recommended to use Ambari-based automatic installation: <http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.2/index.html>
* Local:
     
         $ brew install hadoop
         $ /usr/local/Cellar/hadoop/2.7.1/bin/hadoop namenode -format
         $ /usr/local/Cellar/hadoop/2.7.1/sbin/start-all.sh

# Spark

* Download binary version of Spark 1.5.1 and install next to HDP: <http://spark.apache.org>
* Local:
       
        $ brew install apache-spark 
        $ /usr/local/Cellar/apache-spark/1.5.2/libexec/sbin/start-all.sh

# Radial-Pilot

The Hadoop integration is not part of the current Radical-Pilot 0.37 release and needs to be installed from dedicated package (Status 11/13/2015). To setup an Anaconda environment use the following steps:

    conda create -y -p python2 python=2.7 
    source activate python2

Radical-Pilot Tutorial Package:

    pip install --upgrade radical.pilot.sc15


# Optional for Multiuser: Jupyterhub: 

Web page: <https://github.com/jupyter/jupyterhub>
Installation:

Install node: <https://nodejs.org/en/download/>

    /opt/anaconda/bin/conda create --name python2 python=2
    /opt/anaconda/bin/conda create --name python3 python=3

    source /opt/anaconda/bin/activate python3
    pip install jupyterhub
    mkdir $HOME/jupyterhub
    cd $HOME/jupyterhub
    jupyterhub --generate_config


    su root
    cd /root/jupyterhub
    source activate python3
    nohup jupyterhub -f jupyterhub_config.py &

Install Python2 kernel:

    source /opt/anaconda/bin/activate root
    /opt/anaconda/bin/python -m IPython kernelspec install-self
    
PAM issue:

    https://github.com/jupyter/jupyterhub/issues/323

Configurations: [Jupyterhub Config](./configs/jupyterhub_config.py)



