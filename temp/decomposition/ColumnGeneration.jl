mutable struct ColumnGeneration
    data::Data
    master::MasterFormulation
    pricing::Pricing

    function ColumnGeneration(data::Data)
        constructive = Constructive(data)
        solve!(constructive)
    
        master = MasterFormulation(data, constructive.solution.routes)
        pricing = Pricing(data)
    
        return new(data, master, pricing)
    end
end

function solve!(col_gen::ColumnGeneration)
    solve!(col_gen.master)
end
