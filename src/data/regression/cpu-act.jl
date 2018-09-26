using DataDeps

register(DataDep(
  "cpu-act",
  "http://www.dcc.fc.up.pt/~ltorgo/Regression/DataSets.html",
  "http://www.dcc.fc.up.pt/~ltorgo/Regression/compact.tar.gz",
  "9978dc18e7f41718952da6024249f2e482f96405e867b67f3eefe6d3bd4dc192",
  post_fetch_method=(path -> begin
    unpack(path)
    new_path = joinpath(dirname(path), "ComputerActivity/cpu_act.data")
    mv(new_path, path)

    UCIData.process_dataset(path,
        target_index=22,
        feature_indices=1:21,
    )
  end),
))
