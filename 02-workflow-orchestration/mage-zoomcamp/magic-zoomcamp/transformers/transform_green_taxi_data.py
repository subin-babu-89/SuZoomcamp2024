
import re

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    pattern = re.compile(r'(?<!^)(?=[A-Z])')
    data.columns = data.columns.str.replace('(?<=[a-z])(?=[A-Z])', '_', regex=True).str.lower()

    print(f'Preprocessing: rows with zero passengers : {data["passenger_count"].isin([0]).sum() }')
    transformed_data = data[data["passenger_count"] > 0]

    print(f'Preprocessing: rows with zero trip distance : {transformed_data["trip_distance"].isin([0]).sum() }')
    transformed_data = transformed_data[transformed_data["trip_distance"]> 0]
    
    transformed_data['lpep_pickup_date'] = transformed_data['lpep_pickup_datetime'].dt.date

    return transformed_data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'

    assert 'vendor_id' in output.columns
    assert (output['passenger_count']>0 ).all()
    assert (output['trip_distance'] > 0).all()
