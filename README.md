# Kruskal-Wallis operator

##### Description

The `kruskaltest_operator` performs a Kruskal-Wallis test on the data.

##### Usage

Input projection|.
---|---
`color` | represents the groups to compare
`y-axis`| measurement value

Output relations|.
---|---
`statistic`| numeric, test statistic
`parameter`| numeric, KW test parameter
`p.value`| numeric, p-value calculated per cell

##### Details

The operator is the `kruskal.test` function in base R.

##### References

see the `base::kruskal.test` function of the R package for the documentation.

##### See Also

[ttest](https://github.com/tercen/ttest_operator)