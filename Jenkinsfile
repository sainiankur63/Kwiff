node {
  ws { 
      deleteDir()
    stage ('Deleting snapshot '){
    snapshot()
    }
  }
}

def snapshot(){
sh """ 
      snapshot_mysql=`aws --region eu-west-2 rds describe-db-cluster-snapshots --db-cluster-snapshot-identifier mydbsnapshot2 --query 'DBClusterSnapshots[*].DBClusterSnapshotArn' | tr -d '"[] ' | awk '{ print \$1 }' | awk 'NF'`
"""
}
