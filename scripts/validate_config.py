import yaml
import re

# Define the valid environments and required fields
VALID_ENVIRONMENTS = ['production', 'staging', 'development']
REQUIRED_FIELDS = ['application', 'slo_id', 'env', 'service', 'tags', 'thresholds']

# Define a regex pattern for detecting placeholders
PLACEHOLDER_PATTERN = re.compile(r'__(\w+)__')

# Define a function to validate the YAML configuration

def validate_config(yaml_content):
    # Load the YAML content
    try:
        config = yaml.safe_load(yaml_content)
    except yaml.YAMLError as e:
        return {'valid': False, 'error': str(e)}
    
    # Check for required fields
    for field in REQUIRED_FIELDS:
        if field not in config:
            return {'valid': False, 'error': f'Missing required field: {field}'}
    
    # Validate environment
    if config['env'] not in VALID_ENVIRONMENTS:
        return {'valid': False, 'error': f'Invalid environment: {config['env']}'}
    
    # Validate tags
    if not isinstance(config['tags'], list):
        return {'valid': False, 'error': 'Tags must be a list'}
    
    # Validate thresholds
    if not isinstance(config['thresholds'], dict):
        return {'valid': False, 'error': 'Thresholds must be a dictionary'}
    for key, value in config['thresholds'].items():
        if not isinstance(value, (int, float)):
            return {'valid': False, 'error': f'Threshold for {key} must be a number'}
    
    # Check for unreplaced placeholders
    placeholders = PLACEHOLDER_PATTERN.findall(yaml_content)
    unreplaced_placeholders = [ph for ph in placeholders if ph not in REQUIRED_FIELDS]
    if unreplaced_placeholders:
        return {'valid': False, 'error': f'Unreplaced placeholders found: {unreplaced_placeholders}'}

    return {'valid': True}

# Example usage
if __name__ == '__main__':
    yaml_input = '''
    application: __APPLICATION__
    slo_id: __SLO_ID__
    env: production
    service: my-service
    tags:
      - tag1
      - tag2
    thresholds:
      alert: 10
      warning: 5
    '''
    result = validate_config(yaml_input)
    print(result)
