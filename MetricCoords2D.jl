module MetricCoords2D
export MetricField, Metric, FlatPolarMetric

typealias Metric Array{Float64, 2}
type MetricField
    grid :: Array{Metric, 2}
end

FlatPolarMetric = MetricField(
    [[eye(2), eye(2)] [eye(2), eye(2)]]
)

end
